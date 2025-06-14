echo Input resend API key: 
read Resend_Key

sed -i "s/\[auth.email.smtp\]/,/^\[/s/\(pass = \"\)[^\"]*/\1$Resend_Key/g" supabase/config.toml
tmp=$(sed -E -e "s/service_role key: ([^\n]*)/\1/gm;t;d" <<< $(npx supabase start))

echo $tmp

sed -i "/(SERVICE_ROLE_KEY=)[^\n]*/\1$tmp/" .env
docker compose build
docker compose up -d
