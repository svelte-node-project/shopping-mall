const getOffers = async () => {
    const response = await fetch("http://localhost:3001/companies")
    return await response.json()
  }

export { getOffers };