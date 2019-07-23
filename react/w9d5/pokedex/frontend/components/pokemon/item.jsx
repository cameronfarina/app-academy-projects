import React from "react";
import { Link } from "react-router-dom";

const ItemList = ({ item }) => {
    // debugger
  return (
    <li>
      <Link className="item-link" to={`/pokemon/${item.pokemon_id}/item/${item.id}`}>
        <img className="item-img" src={item.image_url} alt={item.name} />
      </Link>
    </li>
  );
};

export default ItemList;
