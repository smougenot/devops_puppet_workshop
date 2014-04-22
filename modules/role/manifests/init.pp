# Class: role
#
# Role par defaut : installation des outils communs à tous
#
# Sample Usage :
#  include role
#
# ou
#
#  class { 'role': }
class role {
  include profile
 
}

class role::v6 inherits role{
}

class role::p2es inherits role{
}

class role::octopus inherits role{
}

class role::gendoc inherits role{
}

class role::dict inherits role{
}

class role::sa inherits role{
}

class role::map inherits role{
}
class role::commun inherits role{
}

class role::pa inherits role{
}

class role::maplink inherits role{
}