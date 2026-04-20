version: ""

services:
  mongo:
    image: mongo:latest
    container_name: mongo
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

  redis:
    image: redis:latest
    container_name: redis
    ports:
      - "6379:6379"

  kafka:
    image: apache/kafka:3.7.0
    container_name: kafka
    restart: always
    ports:
      - "9092:9092"
    environment:
      KAFKA_PROCESS_ROLES: "broker,controller"
      KAFKA_NODE_ID: "1"
      KAFKA_CONTROLLER_QUORUM_VOTERS: "1@kafka:9093"
      KAFKA_CONTROLLER_LISTENER_NAMES: "CONTROLLER"
      KAFKA_LISTENERS: "PLAINTEXT://:9092,CONTROLLER://:9093"
      KAFKA_ADVERTISED_LISTENERS: "PLAINTEXT://kafka:9092"
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: "PLAINTEXT:PLAINTEXT,CONTROLLER:PLAINTEXT"
      KAFKA_AUTO_CREATE_TOPICS_ENABLE: "true"
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: "1"
      CLUSTER_ID: "MkU3OEVBNTcwNTJENDM2Qk"

  rabbitmq:
    image: rabbitmq:3-management
    container_name: rabbitmq
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      RABBITMQ_DEFAULT_USER: guest
      RABBITMQ_DEFAULT_PASS: guest
    healthcheck:
        test: ["CMD", "rabbitmq-diagnostics", "ping"]
        interval: 10s
        timeout: 5s
        retries: 5
  userservice:
    build: ./userservice
    container_name: user
    ports:
      - "4001:4001"
    depends_on:
      - mongo
      - redis
      - kafka
      - rabbitmq

  contentservice:
    build: ./contentservice
    container_name: content
    ports:
      - "4002:4002"
    depends_on:
      - mongo
      - redis
      - kafka
      - rabbitmq

  courseservice:
    build: ./courseservice
    container_name: course
    ports:
      - "4003:4003"
    depends_on:
      - mongo
      - redis
      - kafka
      - rabbitmq

  authservice:
    build: ./authservice
    container_name: auth
    ports:
      - "4004:4004"
    depends_on:
      - mongo
      - redis
      - kafka
      - rabbitmq

  instituteservice:
    build: ./instituteservice
    container_name: institute
    ports:
      - "4005:4005"
    depends_on:
      - mongo
      - redis
      - kafka
      - rabbitmq

volumes:
  mongo_data:
