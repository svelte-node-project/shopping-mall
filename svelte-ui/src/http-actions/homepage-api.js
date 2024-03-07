const getBanners = async () => {
    const response = await fetch("http://localhost:3001/banners")
    return await response.json()
  }

export { getBanners };