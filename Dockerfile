# Первый этап - сборка приложения
FROM golang:1.20 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код в контейнер
COPY . .

# Сборка приложения
RUN go mod init hello && go mod tidy && go build -o hello .

# Второй этап - создание легковесного контейнера
FROM alpine:latest

# Копируем скомпилированный бинарник из этапа builder
COPY --from=builder /app/hello /hello

# Открываем порт 8080
EXPOSE 8080

# Запуск приложения
CMD ["/hello"]
