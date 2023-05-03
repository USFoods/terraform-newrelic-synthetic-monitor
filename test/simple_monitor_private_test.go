package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestSimpleMonitorPrivateConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/simple_monitor_private",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get output for module name, type, public locations, and tags
	outputName := terraform.Output(t, terraformOptions, "name")
	outputType := terraform.Output(t, terraformOptions, "type")
	outputPrivateLocations := terraform.Output(t, terraformOptions, "private_locations")
	outputTags := terraform.Output(t, terraformOptions, "tags")

	// Assert name is Simple Monitor Private
	assert.Equal(t, "Simple Monitor Private", outputName)
	// Assert type is SIMPLE
	assert.Equal(t, "SIMPLE", outputType)
	// Assert private locations is TF Example
	assert.Equal(t, fmt.Sprint([]string{"TF Example"}), outputPrivateLocations)
	// Assert tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
}
