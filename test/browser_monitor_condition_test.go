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

	// get output for policy name and id
	outputPolicyName := terraform.Output(t, terraformOptions, "policy_name")
	outputPolicyId := terraform.Output(t, terraformOptions, "policy_id")

	// get output for module name, type, public locations, and tags
	outputName := terraform.Output(t, terraformOptions, "name")
	outputType := terraform.Output(t, terraformOptions, "type")
	outputPublicLocations := terraform.Output(t, terraformOptions, "public_locations")
	outputTags := terraform.Output(t, terraformOptions, "tags")

	// get output for condition name, description, policy id, and tags
	outputConditionName := terraform.Output(t, terraformOptions, "condition_name")
	outputConditionDescription := terraform.Output(t, terraformOptions, "condition_description")
	outputConditionPolicyId := terraform.Output(t, terraformOptions, "condition_policy_id")
	outputConditionTags := terraform.Output(t, terraformOptions, "condition_tags")

	// assert policy name is Browser Monitor Condition Policy
	assert.Equal(t, "Browser Monitor Condition Policy", outputPolicyName)
	// assert policy id and condition policy id are the same
	assert.Equal(t, outputPolicyId, outputConditionPolicyId)

	// assert module name is Browser Monitor Condtion
	assert.Equal(t, "Browser Monitor Condition", outputName)
	// assert module type is BROWSER
	assert.Equal(t, "BROWSER", outputType)
	// assert module public locations is US_WEST_1
	assert.Equal(t, fmt.Sprint([]string{"US_WEST_1"}), outputPublicLocations)
	// assert module tags are correct
	expectedTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)

	// assert condition name is Browser Monitor Condition
	assert.Equal(t, "Browser Monitor Condition", outputConditionName)
	// assert condition description is correct
	assert.Equal(t, "NRQL Alert Condition for Monitor: Browser Monitor Condition", outputConditionDescription)
	// assert condition tags are correct
	expectedConditionTags := map[string]string{
		"Origin":   "Terraform",
		"App.Id":   "1234",
		"App.Code": "EXAMPLE",
	}
	assert.Equal(t, fmt.Sprint(expectedConditionTags), outputConditionTags)
}
