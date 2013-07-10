class erlang::repo::yum(
  $local_repo_location      = $erlang::local_repo_location,
  $package_name             = $erlang::package_name,
  $remote_repo_location     = $erlang::remote_repo_location,
) inherits erlang {

  Class['erlang::repo::yum'] -> Package<| title == $package_name |>

  exec { 'erlang-repo-download':
    command => "curl -o ${local_repo_location} ${remote_repo_location}",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    creates => $local_repo_location,
  }

}
