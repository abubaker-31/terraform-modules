output "autoscaling_group_id" {
  description = "The ID of the Auto Scaling Group"
  value       = module.asg.autoscaling_group_id
}

output "launch_template_id" {
  description = "The ID of the Launch Template"
  value       = module.asg.launch_template_id
}