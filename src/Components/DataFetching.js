import React, { useState, useEffect } from 'react'
import axios from 'axios'

function DataFetching() {
    var url = '/get?foo1=bar1&foo2=bar2';
    var loader = "Loading...";
    const [data, setData] = useState([]);
    useEffect(() => {
        axios(url,
            {
                method: 'GET',
                mode: 'no-cors',
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'Content-Type': 'application/json',
                },
                withCredentials: true,
                credentials: 'same-origin',
            })
            .then(res => {
                console.log(res.data)
                setData(res.data)
            })
            .catch(err => {
                console.log(err)
            })
    }, [])

    if (!data) return null;
    var args = data.args ? Object.entries(data.args).map(([key, value]) => <li key={key}>{key}: {value}</li>) : loader;
    var headers = data.headers ? Object.entries(data.headers).map(([key, value]) => <li key={key}>{key}: {value}</li>) : loader;

    return (
        <div>
            <h1>JSON stringify</h1>
            <div><pre>{JSON.stringify(data, null, 2)}</pre></div>
            <div>
                <h1>Access args</h1>
                <ul>
                    {args}
                </ul>
                <h1>Access headers</h1>
                <ul>
                    {headers}
                </ul>
                <h1>Access url</h1>
                <h3>{"url: "}{data.url ? data.url : loader}</h3>
            </div>
        </div>
    )
}

export default DataFetching
