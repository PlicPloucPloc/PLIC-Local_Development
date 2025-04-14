#Clone the Supabase repository
git clone --depth 1 https://github.com/supabase/supabase
#Copy the .env file to the docker directory
cp .env supabase/docker/.env
# Navigate to the docker directory
cd supabase/docker
# Pull the latest images
docker compose pull

# Start the services (in detached mode)
docker compose up -d
