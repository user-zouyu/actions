package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"time"
)

func main() {
	fmt.Println("Welcome using <dev>")
	engine := gin.Default()

	engine.GET("/ping", func(ctx *gin.Context) {
		ctx.JSON(200, map[string]interface{}{
			"code": 0,
			"date": time.Now(),
		})
	})

	err := engine.Run(":8080")
	if err != nil {
		fmt.Println("Service failed to start.")
		return
	}

	fmt.Println("The service starts successfully, listening on port 8080.")
}
