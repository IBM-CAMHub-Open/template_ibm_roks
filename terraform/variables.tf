variable "num_workers" {
  description = "The number of workers to be deployed in the cluster."
}

variable "cluster_name" {
  description = "The base name for the cluster."
}

variable "region" {
  default     = "us-south"
  description = "The IBM Cloud region where you want to deploy your cluster."
}

variable "datacenter" {
  description = "The data center for the cluster, You can get the list with by running bluemix cs locations."
}

variable "machine_type" {
  description = "The CPU cores, memory, network, and speed. You can get a list for a given location by running bluemix cs machine-types <location>."
}

variable "isolation" {
  default = "public"
}

variable "private_vlan_id" {
  description = "Virtual network that allows private communication between worker nodes in this cluster. Can be retrieved by running bx cs vlans <location>."
}

variable "public_vlan_id" {
  description = "Virtual network that allows secured communication between the worker nodes and the IBM-managed master node. Can be retrieved by running bx cs vlans <location>."
}

variable "subnet_id" {
  type        = list(string)
  description = "The portable subnet to use for cluster. A list of available subnets can be retrieved by running bx cs subnets."
}


variable "resource_group_name" {
  type        = string
  description = " The name of the IBM Cloud resource group."
  default     = "default"
}

variable "roks_version" {
  type        = string
  description = "ROKS version for the cluster."
}

variable "wait_time_minutes" {
  type        = string
  description = "The duration, expressed in minutes, to wait for the cluster to become available."
  default     = null
}




