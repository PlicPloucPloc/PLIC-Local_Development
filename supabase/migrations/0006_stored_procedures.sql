CREATE EXTENSION IF NOT EXISTS postgis;

CREATE OR REPLACE FUNCTION public.get_apartment_recommendations(
  p_lat FLOAT,
  p_lon FLOAT,
  p_max_distance_meters INT,
  p_excluded_ids INT[],
  p_desired_count INT,
  p_is_furnished BOOLEAN DEFAULT NULL,
  p_min_surface INT DEFAULT NULL,
  p_max_surface INT DEFAULT NULL,
  p_max_price INT DEFAULT NULL
)
RETURNS TABLE (
    "apartment_id" bigint,
    "name" character varying,
    "is_furnished" boolean,
    "surface" integer,
    "energy_class" "text",
    "available_from" "text",
    "rent" integer,
    "type" "text",
    "ges" "text",
    "description" "text",
    "number_of_rooms" "text",
    "location" "text",
    "number_of_bedrooms" integer,
    "has_elevator" boolean,
    "floor" integer,
    "parking_spaces" integer,
    "number_of_bathrooms" integer,
    "heating_type" "text",
    "heating_mode" "text",
    "construction_year" integer,
    "number_of_floors" integer,
    "orientation" "text",
    "estimated_price" double precision
) AS $$
BEGIN
  RETURN QUERY
  WITH apartments_with_distance AS (
    SELECT 
      a.apartment_id,
      a.name,
      a.is_furnished,
      a.surface,
      a.energy_class,
      a.available_from,
      a.rent,
      a.type,
      a.ges,
      a.description,
      a.number_of_rooms,
      a.location,
      a.number_of_bedrooms,
      a.has_elevator,
      a.floor,
      a.parking_spaces,
      a.number_of_bathrooms,
      a.heating_type,
      a.heating_mode,
      a.construction_year,
      a.number_of_floors,
      a.orientation,
      a.estimated_price,
      ac.lat,
      ac.lon,
      ST_Distance(
        ST_SetSRID(ST_MakePoint(ac.lon, ac.lat), 4326)::geography,
        ST_SetSRID(ST_MakePoint(p_lon, p_lat), 4326)::geography
      ) as dist_meters
    FROM apartment_info a
    JOIN apartment_coordinates ac ON ac.apartment_id=a.apartment_id
    WHERE 
      NOT (a.apartment_id = ANY(p_excluded_ids))
      AND (p_max_price IS NULL OR a.rent <= p_max_price)
      AND (p_min_surface IS NULL OR a.surface >= p_min_surface)
      AND (p_max_surface IS NULL OR a.surface <= p_max_surface)
      AND (p_is_furnished IS NULL OR a.is_furnished = p_is_furnished)
  )
  SELECT 
    awd.apartment_id,
    awd.name,
    awd.is_furnished,
    awd.surface,
    awd.energy_class,
    awd.available_from,
    awd.rent,
    awd.type,
    awd.ges,
    awd.description,
    awd.number_of_rooms,
    awd.location,
    awd.number_of_bedrooms,
    awd.has_elevator,
    awd.floor,
    awd.parking_spaces,
    awd.number_of_bathrooms,
    awd.heating_type,
    awd.heating_mode,
    awd.construction_year,
    awd.number_of_floors,
    awd.orientation,
    awd.estimated_price
  FROM apartments_with_distance awd
  WHERE awd.dist_meters <= p_max_distance_meters
  ORDER BY 
    RANDOM()
  LIMIT p_desired_count;
END;
$$ LANGUAGE plpgsql STABLE;
