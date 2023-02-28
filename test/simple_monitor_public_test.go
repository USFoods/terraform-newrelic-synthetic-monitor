package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestSimpleMonitorPublicConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/simple_monitor_public",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get all output
	outputAll := terraform.OutputAll(t, terraformOptions)

	// We actuall want a map of strings, not interfaces
	output := map[string]string{}
	// Would be nice if this output was built into Terratest
	for k, v := range outputAll {
		output[k] = fmt.Sprintf("%v", v)
	}

	assert.Equal(t, "Simple Monitor Public", output["module_name"])
	assert.Equal(t, "SIMPLE", output["module_type"])
	assert.Equal(t, fmt.Sprint([]string{"US_WEST_1"}), output["module_public_locations"])

	expected_tags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}

	assert.Equal(t, fmt.Sprint(expected_tags), output["module_tags"])
}
