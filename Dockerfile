# Первый этап - сборка приложения
FROM golang:1.20-alpine as builder

# Устанавливаем рабочую директорию
WORKDIR /build

# Копируем исходный код в контейнер
COPY . .

# Сборка приложения с отключением CGO
RUN go mod init hello && go mod tidy && go mod download && go build -o /hello main.go

FROM alpine:3

COPY --from=builder hello /bin/hello

# Открываем порт 8080
EXPOSE 8080

# Запуск приложения
CMD ["/bin/hello"]
