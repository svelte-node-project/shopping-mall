const getBanners = async () => {
  const response = await fetch("http://localhost:3001/banners")
  return await response.json()
}

const getSearchResult = async (searchText) => {
  const response = await fetch(`http://localhost:3001/search?searchText=${searchText}`)
  return await response.json()
}

export { getBanners, getSearchResult };