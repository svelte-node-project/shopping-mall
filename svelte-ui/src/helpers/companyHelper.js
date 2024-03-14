const getCompanyLink = async (id) => {
    const data = await fetch(
        `http://localhost:3001/companies/${id}?main_category=true`
    );
    const companyInfo = await data.json();
    return `/en/stores/${companyInfo.category_name_in_url}/${companyInfo.name_in_url}`;
};

export { getCompanyLink };
