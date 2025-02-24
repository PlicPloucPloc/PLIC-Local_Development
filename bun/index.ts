export default {
  port: 80,
  fetch(request) {
    return new Response("Hello world");
  },
};
