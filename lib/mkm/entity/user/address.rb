module Mkm
  class Entity::User::Address < Entity
    map name: 'name',
        extra: 'extra',
        street: 'street',
        zip: 'zip', city: 'city',
        country: 'country'
  end
end
