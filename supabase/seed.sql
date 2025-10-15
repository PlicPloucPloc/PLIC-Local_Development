insert into storage.buckets
  (id, name, public)
values
  ('apartment-pictures', 'apartment-pictures', true),
  ('user-pictures', 'user-pictures', true);

CREATE POLICY "full-access from authenticated users 1qqqhvb_0" ON storage.objects FOR SELECT TO authenticated USING (bucket_id = 'user-pictures');
CREATE POLICY "full-access from authenticated users 1qqqhvb_1" ON storage.objects FOR INSERT TO authenticated WITH CHECK (bucket_id = 'user-pictures');
CREATE POLICY "full-access from authenticated users 1qqqhvb_2" ON storage.objects FOR UPDATE TO authenticated USING (bucket_id = 'user-pictures');
CREATE POLICY "full-access from authenticated users 1qqqhvb_3" ON storage.objects FOR DELETE TO authenticated USING (bucket_id = 'user-pictures');
