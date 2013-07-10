class erlang::repo::apt(
  $key_signature            = $erlang::key_signature,
  $package_name             = $erlang::package_name,
  $remote_repo_key_location = $erlang::remote_repo_key_location,
  $remote_repo_location     = $erlang::remote_repo_location,
  $repos                    = $erlang::repos,
) {

  Class['erlang::repo::apt'] -> Package<| title == $package_name |>

  apt::source { 'erlang':
    include_src    => false,
    key            => $key_signature,
    key_source     => $remote_repo_key_location,
    location       => $remote_repo_location,
    repos          => $repos,
  }

}
