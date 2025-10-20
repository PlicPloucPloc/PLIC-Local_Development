echo Input Resend API key: 
read Resend_Key

cp .env.example .env

sed -i "/\[auth.email.smtp\]/,/^\[/s/\(pass = \"\)[^\"]*/\1$Resend_Key/" supabase/config.toml
sup_config=$(npx supabase@2.26.9 start)
role_key=$(sed -E -e "s/service_role key: ([^\n]*)/\1/gm;t;d" <<< sup_config)
jwt_key=$(sed -E -e "s/JWT secret: ([^\n]*)/\1/gm;t;d" <<< sup_config)

echo $test

npx supabase@2.26.9 db reset

echo $role_key
echo $jwt_key

sed -i "/(SERVICE_ROLE_KEY=)[^\n]*/\1$role_key/" .env
sed -i "/(JWT_SECRET=)[^\n]*/\1$jwt_key/" .env
docker compose build
docker compose up -d
