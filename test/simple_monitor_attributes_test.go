package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestSimpleMonitorAttributesConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/simple_monitor_attributes",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get output for module name, type, public locations, tags, treat redirect as failure, and bypass head request
	outputName := terraform.Output(t, terraformOptions, "name")
	outputType := terraform.Output(t, terraformOptions, "type")
	outputPublicLocations := terraform.Output(t, terraformOptions, "public_locations")
	outputTags := terraform.Output(t, terraformOptions, "tags")
	outputTreatRedirectAsFailure := terraform.Output(t, terraformOptions, "treat_redirect_as_failure")
	outputBypassHeadRequest := terraform.Output(t, terraformOptions, "bypass_head_request")

	// Assert name is Simple Monitor Attributes
	assert.Equal(t, "Simple Monitor Attributes", outputName)
	// Assert type is SIMPLE
	assert.Equal(t, "SIMPLE", outputType)
	// Assert public locations is US_WEST_1
	assert.Equal(t, fmt.Sprint([]string{"US_WEST_1"}), outputPublicLocations)
	// Assert tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
	// Assert treat redirect as failure is true
	assert.Equal(t, "true", outputTreatRedirectAsFailure)
	// Assert bypass head request is true
	assert.Equal(t, "true", outputBypassHeadRequest)
}
