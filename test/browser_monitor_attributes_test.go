package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBrowserMonitorAttributesConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/browser_monitor_attributes",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// get output for policy name and id
	outputPolicyName := terraform.Output(t, terraformOptions, "policy_name")

	// get output for module name, type, public locations, tags, validation string, verify ssl, and enable screenshot
	outputName := terraform.Output(t, terraformOptions, "name")
	outputType := terraform.Output(t, terraformOptions, "type")
	outputPublicLocations := terraform.Output(t, terraformOptions, "public_locations")
	outputTags := terraform.Output(t, terraformOptions, "tags")
	outputValidationString := terraform.Output(t, terraformOptions, "validation_string")
	outputVerifySsl := terraform.Output(t, terraformOptions, "verify_ssl")
	outputEnableScreenshot := terraform.Output(t, terraformOptions, "enable_screenshot_on_failure_and_script")

	// assert policy name is Browser Monitor Attributes Policy
	assert.Equal(t, "Browser Monitor Attributes Policy", outputPolicyName)
	// assert monitor name is Browser Monitor Attributes
	assert.Equal(t, "Browser Monitor Attributes", outputName)
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
	// assert validation string is "New Relic"
	assert.Equal(t, "New Relic", outputValidationString)
	// assert verify ssl is true
	assert.Equal(t, "true", outputVerifySsl)
	// assert enable screenshot is true
	assert.Equal(t, "true", outputEnableScreenshot)

}
