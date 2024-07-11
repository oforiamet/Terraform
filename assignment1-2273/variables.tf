variable "admin_password" {
  description = "The admin password for the Windows VM"
  default     = "T1n@1980"
}

variable "admin_username" {
  description = "The admin username for the VMs"
  default     = "emmanuel"
}

variable "humber_id" {
  description = "The Humber ID to be used for naming resources"
  default     = "2273"
}

variable "linux_vm_names" {
  description = "A map of names for the Linux VMs"
  type        = map(string)
  default = {
    "vm1" = "linux-vm1"
    "vm2" = "linux-vm2"
    "vm3" = "linux-vm3"
  }
}

variable "linux_vm_size" {
  description = "The size of the Linux VMs"
  default     = "Standard_B1ms"
}

variable "location" {
  description = "The Azure region to deploy resources"
  default     = "CanadaCentral"
}

variable "private_key_path" {
  description = "The path to the private key for SSH access"
  default     = "/home/n01672273/.ssh/id_rsa"
}

variable "public_key_path" {
  description = "The path to the public key for SSH access"
  default     = "/home/n01672273/.ssh/id_rsa.pub"
}

variable "tags" {
  description = "A map of tags to be applied to the resources"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Emmanuel.Ofori"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

variable "windows_vm_count" {
  description = "The number of Windows VMs to be deployed"
  default     = 1
}

variable "windows_vm_size" {
  description = "The size of the Windows VM"
  default     = "Standard_B1ms"
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for diagnostics"
  type        = string
  default     = "/subscriptions/3d97f65a-afbb-4425-a348-09a93517d949/resourceGroups/n01672273-RG/providers/Microsoft.OperationalInsights/workspaces/emmanuelofori"
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The Azure subscription ID"
  type        = string
}

variable "ARM_CLIENT_ID" {
  description = "The Azure AD application client ID"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "The Azure AD application client secret"
  type        = string 
}

variable "ARM_TENANT_ID" {
  description = "The Azure AD tenant ID"
  type        = string
}
