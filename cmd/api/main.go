package main

import (
	"log/slog"
	"os"
	"time"
)

type config struct {
	port      int
	uptime    time.Duration
	startTime time.Time
	env       string
}

type application struct {
	cfg    config
	logger slog.Logger
}

func main() {
	cfg := config{port: 5000}
	cfg.startTime = time.Now()
	cfg.uptime = time.Since(cfg.startTime)
	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))
	app := application{cfg: cfg, logger: *logger}
	app.serve()
}
