package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// create test function named TestBrowserMonitorConditionConfiguration
func TestBrowserMonitorConditionConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/browser_monitor_condition",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get output for policy name and id
	outputPolicyName := terraform.Output(t, terraformOptions, "policy_name")
	outputPolicyId := terraform.Output(t, terraformOptions, "policy_id")

	// Get output for module name, type, public locations, and tags
	outputName := terraform.Output(t, terraformOptions, "name")
	outputType := terraform.Output(t, terraformOptions, "type")
	outputPublicLocations := terraform.Output(t, terraformOptions, "public_locations")
	outputTags := terraform.Output(t, terraformOptions, "tags")

	// Get output for condition id, name, description, policy id, and tags
	outputConditionId := terraform.Output(t, terraformOptions, "condition_id")
	outputConditionName := terraform.Output(t, terraformOptions, "condition_name")
	outputConditionDescription := terraform.Output(t, terraformOptions, "condition_description")
	outputConditionPolicyId := terraform.Output(t, terraformOptions, "condition_policy_id")
	outputConditionTags := terraform.Output(t, terraformOptions, "condition_tags")

	// Assert policy name is Browser Monitor Condition Policy
	assert.Equal(t, "Browser Monitor Condition Policy", outputPolicyName)
	// Assert policy id and condition policy id are the same
	assert.Equal(t, outputPolicyId, outputConditionPolicyId)

	// Assert module name is Browser Monitor Condtion
	assert.Equal(t, "Browser Monitor Condition", outputName)
	// Assert module type is BROWSER
	assert.Equal(t, "BROWSER", outputType)
	// Assert module public locations is US_WEST_1
	assert.Equal(t, fmt.Sprint([]string{"US_WEST_1"}), outputPublicLocations)
	// Assert module tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)

	// Assert condition id is not empty
	assert.NotEmpty(t, outputConditionId)
	// Assert condition name is Browser Monitor Condition
	assert.Equal(t, "Browser Monitor Condition", outputConditionName)
	// Assert condition description is correct
	assert.Equal(t, "NRQL Alert Condition for Monitor: Browser Monitor Condition", outputConditionDescription)
	// Assert condition tags are correct
	expectedConditionTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedConditionTags), outputConditionTags)
}
