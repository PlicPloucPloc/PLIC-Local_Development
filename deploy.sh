echo Input Resend API key: 
read Resend_Key

cp .env.example .env

sed -i "/\[auth.email.smtp\]/,/^\[/s/\(pass = \"\)[^\"]*/\1$Resend_Key/" supabase/config.toml
tmp=$(sed -E -e "s/service_role key: ([^\n]*)/\1/gm;t;d" <<< $(npx supabase@2.26.9 start))

echo $test

npx supabase@2.26.9 db reset

echo $tmp

sed -i "/(SERVICE_ROLE_KEY=)[^\n]*/\1$tmp/" .env
docker compose build
docker compose up -d
