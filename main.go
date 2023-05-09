package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	workingDirs := []string{}
	// NOTE: The target directory is always the current directory in recursive mode
	err := filepath.WalkDir(".", func(path string, d os.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if !d.IsDir() {
			return nil
		}
		// hidden directories are skipped
		if path != "." && strings.HasPrefix(d.Name(), ".") {
			return filepath.SkipDir
		}

		fmt.Println(path)

		workingDirs = append(workingDirs, path)
		return nil
	})

	if err != nil {
		panic(err)
	}
}
