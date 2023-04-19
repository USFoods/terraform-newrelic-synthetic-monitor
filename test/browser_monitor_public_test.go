package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBrowserMonitorPublicconfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/browser_monitor_public",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// get output for name, type, public locations, and tags
	outputName := terraform.Output(t, terraformOptions, "module_name")
	outputType := terraform.Output(t, terraformOptions, "module_type")
	outputPublicLocations := terraform.Output(t, terraformOptions, "module_public_locations")
	outputTags := terraform.Output(t, terraformOptions, "module_tags")

	// assert name is Browser Monitor Public
	assert.Equal(t, "Browser Monitor Public", outputName)
	// assert type is BROWSER
	assert.Equal(t, "BROWSER", outputType)
	// assert public locations is US_WEST_1
	assert.Equal(t, fmt.Sprint([]string{"US_WEST_1"}), outputPublicLocations)
	// assert tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
}
