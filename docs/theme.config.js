import Logo from "./components/logo";

export default {
  logo: () => {
    return (
      <>
        <Logo height={30} />
        <span
          className="mx-2 font-extrabold hidden md:inline select-none"
          title="Kubeconfig Library"
        >
          Kubeconfig Library
        </span>
      </>
    );
  },
  project: {
    link: "https://github.com/fatihsever/kubeconfig-lib",
  },
};
