FROM golang:alpine
RUN apk add git

# Copy the code into the container
COPY . .

RUN go get -v github.com/gorilla/mux

# Build the application
RUN go build -o main .

# Export necessary port
EXPOSE 3555

# Command to run when starting the container
CMD ["./main"]