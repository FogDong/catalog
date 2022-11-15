package main

crd: {
	name: "workflowrun-crd"
	type: "k8s-objects"
	properties: objects: [{
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"annotations": {
				"controller-gen.kubebuilder.io/version": "v0.9.0"
			}
			"creationTimestamp": null
			"name":              "workflowruns.core.oam.dev"
		}
		"spec": {
			"group": "core.oam.dev"
			"names": {
				"categories": [
					"oam",
				]
				"kind":     "WorkflowRun"
				"listKind": "WorkflowRunList"
				"plural":   "workflowruns"
				"shortNames": [
					"wr",
				]
				"singular": "workflowrun"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": [
						{
							"jsonPath": ".status.status"
							"name":     "PHASE"
							"type":     "string"
						},
						{
							"jsonPath": ".metadata.creationTimestamp"
							"name":     "AGE"
							"type":     "date"
						},
					]
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "WorkflowRun is the Schema for the workflowRun API"
							"properties": {
								"apiVersion": {
									"description": "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
									"type":        "string"
								}
								"kind": {
									"description": "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
									"type":        "string"
								}
								"metadata": {
									"type": "object"
								}
								"spec": {
									"description": "WorkflowRunSpec is the spec for the WorkflowRun"
									"properties": {
										"context": {
											"type":                                 "object"
											"x-kubernetes-preserve-unknown-fields": true
										}
										"mode": {
											"description": "WorkflowExecuteMode defines the mode of workflow execution"
											"properties": {
												"steps": {
													"description": "Steps is the mode of workflow steps execution"
													"type":        "string"
												}
												"subSteps": {
													"description": "SubSteps is the mode of workflow sub steps execution"
													"type":        "string"
												}
											}
											"type": "object"
										}
										"workflowRef": {
											"type": "string"
										}
										"workflowSpec": {
											"description": "WorkflowSpec defines workflow steps and other attributes"
											"properties": {
												"mode": {
													"description": "WorkflowExecuteMode defines the mode of workflow execution"
													"properties": {
														"steps": {
															"description": "Steps is the mode of workflow steps execution"
															"type":        "string"
														}
														"subSteps": {
															"description": "SubSteps is the mode of workflow sub steps execution"
															"type":        "string"
														}
													}
													"type": "object"
												}
												"steps": {
													"items": {
														"description": "WorkflowStep defines how to execute a workflow step."
														"properties": {
															"dependsOn": {
																"description": "DependsOn is the dependency of the step"
																"items": {
																	"type": "string"
																}
																"type": "array"
															}
															"if": {
																"description": "If is the if condition of the step"
																"type":        "string"
															}
															"inputs": {
																"description": "Inputs is the inputs of the step"
																"items": {
																	"properties": {
																		"from": {
																			"type": "string"
																		}
																		"parameterKey": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"from",
																		"parameterKey",
																	]
																	"type": "object"
																}
																"type": "array"
															}
															"meta": {
																"description": "Meta is the meta data of the workflow step."
																"properties": {
																	"alias": {
																		"type": "string"
																	}
																}
																"type": "object"
															}
															"name": {
																"description": "Name is the unique name of the workflow step."
																"type":        "string"
															}
															"outputs": {
																"description": "Outputs is the outputs of the step"
																"items": {
																	"properties": {
																		"name": {
																			"type": "string"
																		}
																		"valueFrom": {
																			"type": "string"
																		}
																	}
																	"required": [
																		"name",
																		"valueFrom",
																	]
																	"type": "object"
																}
																"type": "array"
															}
															"properties": {
																"description":                          "Properties is the properties of the step"
																"type":                                 "object"
																"x-kubernetes-preserve-unknown-fields": true
															}
															"subSteps": {
																"items": {
																	"description": "WorkflowStepBase defines the workflow step base"
																	"properties": {
																		"dependsOn": {
																			"description": "DependsOn is the dependency of the step"
																			"items": {
																				"type": "string"
																			}
																			"type": "array"
																		}
																		"if": {
																			"description": "If is the if condition of the step"
																			"type":        "string"
																		}
																		"inputs": {
																			"description": "Inputs is the inputs of the step"
																			"items": {
																				"properties": {
																					"from": {
																						"type": "string"
																					}
																					"parameterKey": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"from",
																					"parameterKey",
																				]
																				"type": "object"
																			}
																			"type": "array"
																		}
																		"meta": {
																			"description": "Meta is the meta data of the workflow step."
																			"properties": {
																				"alias": {
																					"type": "string"
																				}
																			}
																			"type": "object"
																		}
																		"name": {
																			"description": "Name is the unique name of the workflow step."
																			"type":        "string"
																		}
																		"outputs": {
																			"description": "Outputs is the outputs of the step"
																			"items": {
																				"properties": {
																					"name": {
																						"type": "string"
																					}
																					"valueFrom": {
																						"type": "string"
																					}
																				}
																				"required": [
																					"name",
																					"valueFrom",
																				]
																				"type": "object"
																			}
																			"type": "array"
																		}
																		"properties": {
																			"description":                          "Properties is the properties of the step"
																			"type":                                 "object"
																			"x-kubernetes-preserve-unknown-fields": true
																		}
																		"timeout": {
																			"description": "Timeout is the timeout of the step"
																			"type":        "string"
																		}
																		"type": {
																			"description": "Type is the type of the workflow step."
																			"type":        "string"
																		}
																	}
																	"required": [
																		"name",
																		"type",
																	]
																	"type": "object"
																}
																"type": "array"
															}
															"timeout": {
																"description": "Timeout is the timeout of the step"
																"type":        "string"
															}
															"type": {
																"description": "Type is the type of the workflow step."
																"type":        "string"
															}
														}
														"required": [
															"name",
															"type",
														]
														"type": "object"
													}
													"type": "array"
												}
											}
											"type": "object"
										}
									}
									"type": "object"
								}
								"status": {
									"description": "WorkflowRunStatus record the status of workflow run"
									"properties": {
										"conditions": {
											"description": "Conditions of the resource."
											"items": {
												"description": "A Condition that may apply to a resource."
												"properties": {
													"lastTransitionTime": {
														"description": "LastTransitionTime is the last time this condition transitioned from one status to another."
														"format":      "date-time"
														"type":        "string"
													}
													"message": {
														"description": "A Message containing details about this condition's last transition from one status to another, if any."
														"type":        "string"
													}
													"reason": {
														"description": "A Reason for this condition's last transition from one status to another."
														"type":        "string"
													}
													"status": {
														"description": "Status of this condition; is it currently True, False, or Unknown?"
														"type":        "string"
													}
													"type": {
														"description": "Type of this condition. At most one of each condition type may apply to a resource at any point in time."
														"type":        "string"
													}
												}
												"required": [
													"lastTransitionTime",
													"reason",
													"status",
													"type",
												]
												"type": "object"
											}
											"type": "array"
										}
										"contextBackend": {
											"description": "ObjectReference contains enough information to let you inspect or modify the referred object. --- New uses of this type are discouraged because of difficulty describing its usage when embedded in APIs. 1. Ignored fields.  It includes many fields which are not generally honored.  For instance, ResourceVersion and FieldPath are both very rarely valid in actual usage. 2. Invalid usage help.  It is impossible to add specific help for individual usage.  In most embedded usages, there are particular restrictions like, \"must refer only to types A and B\" or \"UID not honored\" or \"name must be restricted\". Those cannot be well described when embedded. 3. Inconsistent validation.  Because the usages are different, the validation rules are different by usage, which makes it hard for users to predict what will happen. 4. The fields are both imprecise and overly precise.  Kind is not a precise mapping to a URL. This can produce ambiguity during interpretation and require a REST mapping.  In most cases, the dependency is on the group,resource tuple and the version of the actual struct is irrelevant. 5. We cannot easily change it.  Because this type is embedded in many locations, updates to this type will affect numerous schemas.  Don't make new APIs embed an underspecified API type they do not control. Instead of using this type, create a locally provided and used type that is well-focused on your reference. For example, ServiceReferences for admission registration: https://github.com/kubernetes/api/blob/release-1.17/admissionregistration/v1/types.go#L533 ."
											"properties": {
												"apiVersion": {
													"description": "API version of the referent."
													"type":        "string"
												}
												"fieldPath": {
													"description": "If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: \"spec.containers{name}\" (where \"name\" refers to the name of the container that triggered the event) or if no container name is specified \"spec.containers[2]\" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object. TODO: this design is not final and this field is subject to change in the future."
													"type":        "string"
												}
												"kind": {
													"description": "Kind of the referent. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
													"type":        "string"
												}
												"name": {
													"description": "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names"
													"type":        "string"
												}
												"namespace": {
													"description": "Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/"
													"type":        "string"
												}
												"resourceVersion": {
													"description": "Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency"
													"type":        "string"
												}
												"uid": {
													"description": "UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids"
													"type":        "string"
												}
											}
											"type": "object"
										}
										"endTime": {
											"format": "date-time"
											"type":   "string"
										}
										"finished": {
											"type": "boolean"
										}
										"message": {
											"type": "string"
										}
										"mode": {
											"description": "WorkflowExecuteMode defines the mode of workflow execution"
											"properties": {
												"steps": {
													"description": "Steps is the mode of workflow steps execution"
													"type":        "string"
												}
												"subSteps": {
													"description": "SubSteps is the mode of workflow sub steps execution"
													"type":        "string"
												}
											}
											"type": "object"
										}
										"startTime": {
											"format": "date-time"
											"type":   "string"
										}
										"status": {
											"description": "WorkflowRunPhase is a label for the condition of a WorkflowRun at the current time"
											"type":        "string"
										}
										"steps": {
											"items": {
												"description": "WorkflowStepStatus record the status of a workflow step, include step status and subStep status"
												"properties": {
													"firstExecuteTime": {
														"description": "FirstExecuteTime is the first time this step execution."
														"format":      "date-time"
														"type":        "string"
													}
													"id": {
														"type": "string"
													}
													"lastExecuteTime": {
														"description": "LastExecuteTime is the last time this step execution."
														"format":      "date-time"
														"type":        "string"
													}
													"message": {
														"description": "A human readable message indicating details about why the workflowStep is in this state."
														"type":        "string"
													}
													"name": {
														"type": "string"
													}
													"phase": {
														"description": "WorkflowStepPhase describes the phase of a workflow step."
														"type":        "string"
													}
													"reason": {
														"description": "A brief CamelCase message indicating details about why the workflowStep is in this state."
														"type":        "string"
													}
													"subSteps": {
														"items": {
															"description": "StepStatus record the base status of workflow step, which could be workflow step or subStep"
															"properties": {
																"firstExecuteTime": {
																	"description": "FirstExecuteTime is the first time this step execution."
																	"format":      "date-time"
																	"type":        "string"
																}
																"id": {
																	"type": "string"
																}
																"lastExecuteTime": {
																	"description": "LastExecuteTime is the last time this step execution."
																	"format":      "date-time"
																	"type":        "string"
																}
																"message": {
																	"description": "A human readable message indicating details about why the workflowStep is in this state."
																	"type":        "string"
																}
																"name": {
																	"type": "string"
																}
																"phase": {
																	"description": "WorkflowStepPhase describes the phase of a workflow step."
																	"type":        "string"
																}
																"reason": {
																	"description": "A brief CamelCase message indicating details about why the workflowStep is in this state."
																	"type":        "string"
																}
																"type": {
																	"type": "string"
																}
															}
															"required": [
																"id",
															]
															"type": "object"
														}
														"type": "array"
													}
													"type": {
														"type": "string"
													}
												}
												"required": [
													"id",
												]
												"type": "object"
											}
											"type": "array"
										}
										"suspend": {
											"type": "boolean"
										}
										"suspendState": {
											"type": "string"
										}
										"terminated": {
											"type": "boolean"
										}
									}
									"required": [
										"finished",
										"mode",
										"status",
										"suspend",
										"terminated",
									]
									"type": "object"
								}
							}
							"type": "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}]
}
