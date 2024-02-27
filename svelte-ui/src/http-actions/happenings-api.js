const getHappenings = async () => {
    const response = await fetch("http://localhost:3001/news")
    return await response.json()
  }
  
  const getEvent = async (eventId) => {
    const response = await fetch(`http://localhost:3001/news/${eventId}`)
    return await response.json()
  }
  
  export { getHappenings, getEvent };