docker compose up -d

echo Input resend API key: 

read Resend_Key

sed -i "/\[auth.email.smtp\]/,/^\[/s/\(pass = \"\)[^\"]*/\1$Resend_Key/" supabase/config.toml

npx supabase start
