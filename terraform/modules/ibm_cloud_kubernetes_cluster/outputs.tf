output "cluster_name" {
  value = data.ibm_container_cluster_config.cluster_config.cluster_name_id
}

output "cluster_config" {
  value = base64encode(
    file(
      data.ibm_container_cluster_config.cluster_config.config_file_path,
    ),
  )
}
