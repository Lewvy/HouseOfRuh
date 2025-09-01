package main

import (
	"net/http"
	"time"
)

type envelope map[string]any

func (app *application) healthcheck(w http.ResponseWriter, r *http.Request) {
	env := envelope{
		"version":    1,
		"start time": app.cfg.startTime,
		"uptime":     app.getUptime(),
	}

	if err := app.writeJson(w, http.StatusOK, env, nil); err != nil {
		app.logError(r, err)
	}

}

func (app *application) getUptime() string {
	return time.Since(app.cfg.startTime).String()
}
