
axios.get(`${RAPIDAPI_API_URL}/${STUDENT_ID}`, { headers: RAPIDAPI_REQUEST_HEADERS })
  .then(response => {
          console.log(response.data);
  })
  .catch(error => console.error('On get student error', error))