const searchParams = $state({});

const useSearchParams = () => {
    return {
        getSearchParams: () => {
            return searchParams;
        },
        setSearchParams: (name, value) => {
            searchParams[name] = value;
        },
    };
};

export { useSearchParams };
