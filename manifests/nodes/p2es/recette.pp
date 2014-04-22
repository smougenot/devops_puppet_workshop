# Node: pour PE, PE-BO, PS, LB

# Install la plateforme lb v3 v2
#

# Install la plateforme pe bo v3
#
node /^.*vpeborecette.*$/ inherits base{

    # Role
    class{ role::p2es::v3::bo: }
}

# Install la plateforme pe v3
#
node /^.*vperecette.*$/ inherits base{

    # Role
    class{ role::p2es::v3::pe: }
}

# Install la plateforme ps v3
#
# Install le back office
#
# node /^(vtcp2esborecette|vtcp2esrecette)$/ inherits base{

    # # Role
    # class{ role::p2es::v2::bo: }
# }