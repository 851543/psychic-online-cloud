package com.psychic.ai.config;

import com.psychic.ai.properties.AiProperties;
import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.DocumentSplitter;
import dev.langchain4j.data.document.parser.TextDocumentParser;
import dev.langchain4j.data.document.splitter.DocumentSplitters;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.experimental.rag.content.retriever.sql.SqlDatabaseContentRetriever;
import dev.langchain4j.model.chat.StreamingChatLanguageModel;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.model.input.PromptTemplate;
import dev.langchain4j.model.ollama.OllamaChatModel;
import dev.langchain4j.model.ollama.OllamaEmbeddingModel;
import dev.langchain4j.model.ollama.OllamaStreamingChatModel;
import dev.langchain4j.rag.DefaultRetrievalAugmentor;
import dev.langchain4j.rag.RetrievalAugmentor;
import dev.langchain4j.rag.content.aggregator.ContentAggregator;
import dev.langchain4j.rag.content.aggregator.DefaultContentAggregator;
import dev.langchain4j.rag.content.injector.ContentInjector;
import dev.langchain4j.rag.content.injector.DefaultContentInjector;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.rag.content.retriever.EmbeddingStoreContentRetriever;
import dev.langchain4j.rag.query.router.DefaultQueryRouter;
import dev.langchain4j.rag.query.router.QueryRouter;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import dev.langchain4j.store.embedding.inmemory.InMemoryEmbeddingStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import javax.sql.DataSource;
import java.io.IOException;
import java.time.Duration;
import java.util.concurrent.ExecutorService;

import static dev.langchain4j.data.document.loader.FileSystemDocumentLoader.loadDocument;

@Configuration
public class AiConfig {

    @Autowired
    private AiProperties aiProperties;

    @Bean
    public OllamaChatModel chatModel() {
        return OllamaChatModel.builder()
                .baseUrl(aiProperties.getBaseUrl())
                .modelName(aiProperties.getModelName())
                .temperature(aiProperties.getTemperature())
                .timeout(Duration.ofSeconds(aiProperties.getTimeout()))
                .build();
    }

    @Bean
    public StreamingChatLanguageModel chatLanguageModel() {
        return OllamaStreamingChatModel.builder()
                .baseUrl(aiProperties.getBaseUrl())
                .modelName(aiProperties.getModelName())
                .temperature(aiProperties.getTemperature())
                .timeout(Duration.ofSeconds(aiProperties.getTimeout()))
                .build();
    }

    @Bean
    public EmbeddingModel embeddingModel() {
        return OllamaEmbeddingModel.builder()
                .baseUrl(aiProperties.getBaseUrl())
                .modelName(aiProperties.getModelName())
                .timeout(Duration.ofSeconds(aiProperties.getTimeout()))
                .build();
    }

    @Bean
    public EmbeddingStore<TextSegment> embeddingStore(EmbeddingModel embeddingModel, ResourceLoader resourceLoader) throws IOException {
        EmbeddingStore<TextSegment> embeddingStore = new InMemoryEmbeddingStore<>();

        Resource resource = resourceLoader.getResource("classpath:templates/terms-of-use.txt");
        Document document = loadDocument(resource.getFile().toPath(), new TextDocumentParser());

        DocumentSplitter documentSplitter = DocumentSplitters.recursive(500, 0);
        EmbeddingStoreIngestor embeddingStoreIngestor = EmbeddingStoreIngestor.builder()
                .documentSplitter(documentSplitter)
                .embeddingModel(embeddingModel)
                .embeddingStore(embeddingStore)
                .build();
        embeddingStoreIngestor.ingest(document);

        return embeddingStore;
    }

    @Bean
    public ContentRetriever contentRetrieverDevice(OllamaChatModel chatModel, DataSource masterDataSource) {
        return SqlDatabaseContentRetriever.builder()
                .dataSource(masterDataSource)
                .chatLanguageModel(chatModel)
                .sqlDialect("test")
                .build();
    }

    @Bean
    public ContentRetriever contentRetriever(EmbeddingStore<TextSegment> embeddingStore, EmbeddingModel embeddingModel) {
        return EmbeddingStoreContentRetriever.builder()
                .embeddingStore(embeddingStore)
                .embeddingModel(embeddingModel)
                .maxResults(3)
                .minScore(0.75)
                .build();
    }

    @Bean
    public QueryRouter queryRouter(ContentRetriever contentRetriever, ContentRetriever contentRetrieverDevice) {
        return new DefaultQueryRouter(contentRetriever, contentRetrieverDevice);
    }

    @Bean
    public ContentAggregator contentAggregator() {
        return new DefaultContentAggregator();
    }

    @Bean
    public ContentInjector contentInjector() {
        return DefaultContentInjector.builder()
                .promptTemplate(PromptTemplate.from("{{userMessage}}\n" + "使用以下信息回答：" + "\n{{contents}}\n" ))
                .build();
    }

    @Bean
    public RetrievalAugmentor retrievalAugmentor(QueryRouter queryRouter, ContentAggregator contentAggregator, ContentInjector contentInjector, ExecutorService AiRetrievalExecutorService) {
        return DefaultRetrievalAugmentor.builder()
                .queryRouter(queryRouter)
                .contentAggregator(contentAggregator)
                .contentInjector(contentInjector)
                .executor(AiRetrievalExecutorService)
                .build();
    }
}
