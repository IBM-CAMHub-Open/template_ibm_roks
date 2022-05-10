provider "ibm" {
  region  = var.region
}

data "ibm_resource_group" "named_group" {
  name = var.resource_group_name
}

data "ibm_container_cluster_versions" "cluster_versions" {
  resource_group_id = data.ibm_resource_group.named_group.id
}


################################################
# Create/manage cluster
################################################
resource "ibm_container_cluster" "kubecluster" {
  name              = var.cluster_name
  datacenter        = var.datacenter
  hardware          = var.isolation
  machine_type      = var.machine_type
  public_vlan_id    = var.public_vlan_id
  private_vlan_id   = var.private_vlan_id
  subnet_id         = var.subnet_id
  default_pool_size = var.num_workers
  resource_group_id = data.ibm_resource_group.named_group.id
  kube_version = var.kube_version
  wait_time_minutes = var.wait_time_minutes
}
data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id   = ibm_container_cluster.kubecluster.name
  resource_group_id = data.ibm_resource_group.named_group.id
}

################################################
# Find worker IP addresses
################################################
data "ibm_container_cluster" "cluster" {
  cluster_name_id   = ibm_container_cluster.kubecluster.name
  resource_group_id = data.ibm_resource_group.named_group.id
}

data "ibm_container_cluster_worker" "cluster_workers" {
  count             = "1"
  worker_id         = element(data.ibm_container_cluster.cluster.workers, count.index)
  resource_group_id = data.ibm_resource_group.named_group.id
}

