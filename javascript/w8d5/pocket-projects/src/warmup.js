const partyHeader = document.getElementById("party");
//const partyPlanning = document.getElementById("cake")
export const htmlGenerator = (string, htmlElement) => {
  if (htmlElement.children) {
      let kids = Array.from(htmlElement.children);
    kids.forEach(child => htmlElement.removeChild(child));
  }

  let HTMLstring = document.createElement("p");
  HTMLstring.textContent = string;
  htmlElement = htmlElement.appendChild(HTMLstring);
};

htmlGenerator("Party Time.", partyHeader);

// module.exports = htmlGenerator();
// export default htmlGenerator
