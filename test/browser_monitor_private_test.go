package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBrowserMonitorPrivateConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/browser_monitor_private",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// get output for module name, type, private locations, and tags
	outputName := terraform.Output(t, terraformOptions, "module_name")
	outputType := terraform.Output(t, terraformOptions, "module_type")
	outputPrivateLocations := terraform.Output(t, terraformOptions, "module_private_locations")
	outputTags := terraform.Output(t, terraformOptions, "module_tags")

	// assert name is Browser Monitor Private
	assert.Equal(t, "Browser Monitor Private", outputName)
	// assert type is BROWSER
	assert.Equal(t, "BROWSER", outputType)
	// assert private locations is TF Example
	assert.Equal(t, fmt.Sprint([]string{"TF Example"}), outputPrivateLocations)
	// assert tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
}
