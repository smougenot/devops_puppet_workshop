# Node: pour PE, PE-BO, PS, LB

# Install la plateforme pe bo v3
#
node /^.*vpeboprod.*$/ inherits base{

    # Role
    class{ role::p2es::v3::bo: }
}

# Install la plateforme pe v3
#
node /^.*vpeprod.*$/ inherits base{

    # Role
    class{ role::p2es::v3::pe: }
}
