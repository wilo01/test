import React from 'react';
import DataFetching from './Components/DataFetching';
import "./Styles/styles.css";

export default function App() {
  return (
    <div>
      <main>
        <section className="info">
        <DataFetching />
        </section>
      </main>
      {/* <footer className="footer">
      </footer> */}
    </div>
  );
}