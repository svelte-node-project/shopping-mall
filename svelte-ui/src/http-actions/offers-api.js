const getOffers = async () => {
  const response = await fetch("http://localhost:3001/offers");
  return await response.json();
};

const getOffer = async (offerId) => {
  const response = await fetch(`http://localhost:3001/offers/${offerId}`);
  return await response.json();
};

const getCompanyLink = async (companyId) => {
  const response = await fetch(`http://localhost:3001/companies/${companyId}`);
  return await response.json();
};

export { getOffers, getOffer, getCompanyLink };
