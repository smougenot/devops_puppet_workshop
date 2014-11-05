class puppet::repo::puppetlabs{
  $yum_name = 'puppetlabs-products'
  $yum_name_deps = 'puppetlabs-deps'
  $yum_repo_rpm = "http://yum.puppetlabs.com/puppetlabs-release-el-${::operatingsystemmajrelease}.noarch.rpm"

  exec {"install_yum_rpm_${yum_repo_rpm}":
    command => "yum localinstall -y ${yum_repo_rpm}"
  }
}