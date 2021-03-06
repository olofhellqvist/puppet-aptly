require 'puppet/parameter/boolean'

Puppet::Type.newtype(:aptly_repo) do
  @doc = 'Creates a new Aptly repo
  '

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the Aptly repo. Example : frontend_apps'
  end

  newparam(:force, boolean: true, parent: Puppet::Parameter::Boolean) do
    desc 'Force to drop the Apt repository even if it used as source of some snapshot'
    defaultto :true
  end

  newparam(:default_component) do
    desc 'Default component when publishing. Example : main'
    validate do |value|
      unless value.instance_of? String
        raise ArgumentError, '%s is not a valid component (should be a string)' % value
      end
    end
    defaultto 'main'
  end

  newparam(:default_distribution) do
    desc 'Default distribution when publishing'
    validate do |value|
      unless value.instance_of? String
        raise ArgumentError, '%s is not a valid distribution (should be a string)' % value
      end
    end
    defaultto ''
  end
end
