import { createContext, useContext } from "react";

const HomeContext = createContext({});

export default HomeContext;
export const useHomeContext = () => useContext(HomeContext);
