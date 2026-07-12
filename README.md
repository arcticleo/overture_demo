# Overture Demo

Demo Rails application for the [overture_maps](../overture_maps) gem.

## Setup

The development database is PostgreSQL + PostGIS via Docker:

```bash
docker compose up -d      # PostGIS on localhost:5433
bundle install
bin/rails db:prepare
```

## Importing Overture data

```bash
# Fetch the places category taxonomy (enables group filters like eat_and_drink)
bin/rails overture_maps:categories:populate

# Import by location name or bounding box
bin/rails overture_maps:import:places[Seattle]
bin/rails "overture_maps:import:places[47.608_-122.342_47.610_-122.339]"

# Import divisions once and location searches resolve locally
bin/rails overture_maps:import:divisions[Washington]

# Everything for an area
bin/rails overture_maps:import:all[Seattle]
```

Then in `bin/rails console`:

```ruby
OverturePlace.near(47.6090, -122.3405, 200).by_category("coffee_shop")
OvertureSegment.roads.within_bounds(47.6, -122.35, 47.62, -122.33)
OvertureMaps.query(theme: "places", location: "Seattle").limit(10).to_geojson
```

## Deployment

Kamal is configured with a PostGIS accessory (`config/deploy.yml`); set real
server IPs and add `POSTGRES_PASSWORD` / `OVERTURE_DEMO_DATABASE_PASSWORD`
to `.kamal/secrets` before deploying.
